function hitung() {
  let a = parseFloat(document.getElementById("a").value);
  let b = parseFloat(document.getElementById("b").value);
  if (isNaN(a) || isNaN(b)) {
    document.getElementById("c").textContent = "Masukkan angka yang valid!";
    return;
  }
  let c = Math.sqrt(a * a + b * b);
  document.getElementById("c").textContent = "c = " + c.toFixed(2);
}