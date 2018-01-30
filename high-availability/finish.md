<script>
function logFinished() {
  console.log("Finish.md")
  var ifrm = document.createElement("iframe");
  ifrm.setAttribute("src", "http://resources.storageos.com/tutorial-complete");
  ifrm.style.width = "0px";
  ifrm.style.height = "0px";
  document.body.appendChild(ifrm);
}

var el = document.getElementById("finished");
el.addEventListener("click", logFinished, {once: true});

</script>
