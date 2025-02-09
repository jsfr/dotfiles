import { useState, useEffect } from "react"
import { createRoot } from "react-dom/client"
import * as zebar from "zebar"

const providers = zebar.createProviderGroup({
  glazewm: { type: "glazewm" },
  date: { type: "date", formatting: "EEE d MMM t" },
  battery: { type: "battery" },
})

createRoot(document.getElementById("root")!).render(<App />)

function App() {
  const [output, setOutput] = useState(providers.outputMap)

  useEffect(() => {
    providers.onOutput(() => setOutput(providers.outputMap))
  }, [])

  // Get icon to show for how much of the battery is charged.
  function getBatteryIcon(batteryOutput: any) {
    if (batteryOutput.chargePercent > 90)
      return <i className="nf nf-fa-battery_4"></i>
    if (batteryOutput.chargePercent > 70)
      return <i className="nf nf-fa-battery_3"></i>
    if (batteryOutput.chargePercent > 40)
      return <i className="nf nf-fa-battery_2"></i>
    if (batteryOutput.chargePercent > 20)
      return <i className="nf nf-fa-battery_1"></i>
    return <i className="nf nf-fa-battery_0"></i>
  }

  return (
    <div className="app">
      <div className="left">
        {output.glazewm && (
          <div className="workspaces">
            {output.glazewm.currentWorkspaces.map((workspace) => (
              <button
                className={`workspace ${workspace.hasFocus && "focused"} ${workspace.isDisplayed && "displayed"}`}
                onClick={() =>
                  output.glazewm?.runCommand(
                    `focus --workspace ${workspace.name}`,
                  )
                }
                key={workspace.name}
              >
                {workspace.displayName ?? workspace.name}
              </button>
            ))}
          </div>
        )}
      </div>

      <div className="center">{output.date?.formatted}</div>

      <div className="right">
        {output.glazewm && (
          <>
            {output.glazewm.bindingModes.map((bindingMode) => (
              <button className="binding-mode" key={bindingMode.name}>
                {bindingMode.displayName ?? bindingMode.name}
              </button>
            ))}

            <button
              className={`tiling-direction nf ${output.glazewm.tilingDirection === "horizontal" ? "nf-md-swap_horizontal" : "nf-md-swap_vertical"}`}
              onClick={() =>
                output.glazewm?.runCommand("toggle-tiling-direction")
              }
            ></button>
          </>
        )}

        {output.battery && (
          <div className="battery">
            {/* Show icon for whether battery is charging. */}
            {output.battery.isCharging && (
              <i className="nf nf-md-power_plug charging-icon"></i>
            )}
            {getBatteryIcon(output.battery)}
            {Math.round(output.battery.chargePercent)}%
          </div>
        )}
      </div>
    </div>
  )
}
