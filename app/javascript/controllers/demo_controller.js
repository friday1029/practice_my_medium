// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    console.log(this.contentTarget)
    console.log("hi")
  }
  pushme(){
    let content = this.contentTarget.value
    console.log(content)
  }
  pushit(){
    let content = this.contentTarget.value
    console.log(content)
  }

}
