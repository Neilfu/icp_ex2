import { icp_ex2_backend } from "../../declarations/icp_ex2_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const strInput = document.getElementById("toSort").value.toString();
  const toSortSeqence = strInput.split(';').map((strNumber)=>{
    return Number(strNumber)
  });

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const result = await icp_ex2_backend.qsort(toSortSeqence);

  button.removeAttribute("disabled");

  document.getElementById("result").innerText = result.toString();

  return false;
});
