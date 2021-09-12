<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="PresenterPopOver_0"></a>PresenterPopOver</h1>
<h2 class="code-line" data-line-start=1 data-line-end=2 ><a id="UIPresentationController_Helper_1"></a>UIPresentationController Helper</h2>
<p class="has-line-data" data-line-start="4" data-line-end="5">PresenterPopOver is a Custom PresentationController which helps Developer to Present any ViewController with Styles and with Custom Height.</p>
<ul>
<li class="has-line-data" data-line-start="6" data-line-end="7">Contains Different Styles.</li>
<li class="has-line-data" data-line-start="7" data-line-end="8">Can Adjust the Height.</li>
<li class="has-line-data" data-line-start="8" data-line-end="10">✨Magic ✨</li>
</ul>
<h2 class="code-line" data-line-start=10 data-line-end=11 ><a id="Usage_10"></a>Usage</h2>
<ul>
<li class="has-line-data" data-line-start="12" data-line-end="14">Import a PresenterPopOver<br>
(import PresenterPopOver)</li>
<li class="has-line-data" data-line-start="14" data-line-end="21">Assign your Fav UIView to the CustomPresentationViewController<br>
{<br>
let vc = CustomPresentationViewController(with: Your_View)<br>
vc.modalPresentationStyle = .custom<br>
vc.transitioningDelegate = self<br>
self.present(vc, animated: true, completion: nil)<br>
}</li>
<li class="has-line-data" data-line-start="21" data-line-end="28">Return CutomPresentationviewController in UIViewControllerTransitioningDelegate<br>
{<br>
func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -&gt; UIPresentationController? {<br>
CutomPresentationviewController(presentedViewController: presented, presenting: presenting, blurEffectStyle: .dark, height: Your_Height, type: .Bubble(totalObject: Your_Number_Of_Bubble))<br>
}<br>
}</li>
</ul>
<a href="https://postimg.cc/hQz74Y6t" target="_blank"><img src="https://i.postimg.cc/XqxKLSgd/IMG-8785.png" alt="IMG-8785"/></a><br/><br/>
<a href="https://postimg.cc/HjVMtJn1" target="_blank"><img src="https://i.postimg.cc/59mmbLMy/IMG-8786.png" alt="IMG-8786"/></a><br/><br/>
<a href="https://postimg.cc/JtvkY1HD" target="_blank"><img src="https://i.postimg.cc/c44BHCsm/IMG-8787.png" alt="IMG-8787"/></a><br/><br/>
<a href="https://postimg.cc/56zFZZ8P" target="_blank"><img src="https://i.postimg.cc/tCStVbJH/IMG-8788.png" alt="IMG-8788"/></a><br/><br/>
<a href="https://postimg.cc/qNX67yby" target="_blank"><img src="https://i.postimg.cc/fR1cBvY2/IMG-8789.png" alt="IMG-8789"/></a><br/><br/>
<a href="https://postimg.cc/9DjqVJpc" target="_blank"><img src="https://i.postimg.cc/L8JktWgg/IMG-8790.png" alt="IMG-8790"/></a><br/><br/>

<h2 class="code-line" data-line-start=28 data-line-end=29 ><a id="Installation_28"></a>Installation</h2>
<p class="has-line-data" data-line-start="30" data-line-end="31">PresenterPopOver requires <a href="https://cocoapods.org">Cocoapods</a>.</p>
<p class="has-line-data" data-line-start="32" data-line-end="33">Install the pod and Import the PresenterPoper.</p>
<pre><code class="has-line-data" data-line-start="35" data-line-end="37" class="language-sh">pod <span class="hljs-string">'PresenterPopOver'</span>
</code></pre>
<p class="has-line-data" data-line-start="38" data-line-end="39">Or You Can Just Copy Presenter Folder From Repository.</p>
<pre><code class="has-line-data" data-line-start="41" data-line-end="43" class="language-sh">Github [PresenterPopOver] (https://github.com/NikhilSwift/Presenter).
</code></pre>
<h2 class="code-line" data-line-start=45 data-line-end=46 ><a id="License_45"></a>License</h2>
<p class="has-line-data" data-line-start="47" data-line-end="48">MIT</p>
<p class="has-line-data" data-line-start="49" data-line-end="50"><strong>Free Software, Hell Yeah!</strong></p>
