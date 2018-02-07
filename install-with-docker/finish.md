<script>
// Ugly way to log a user completed (moused over the finished bar) with a hubspot tracked page.

function logFinished() {
  var ifrm = document.createElement("iframe");
  ifrm.setAttribute("src", "https://resources.storageos.com/tutorial-complete");
  ifrm.style.width = "0px";
  ifrm.style.height = "0px";
  document.body.appendChild(ifrm);
}

var el = document.getElementById("finished");
  el.addEventListener("mouseover", logFinished, {once: true});
</script>
