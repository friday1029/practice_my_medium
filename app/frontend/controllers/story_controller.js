// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import axios from 'axios'


export default class extends Controller {
  static targets = [ "clapCount" ]

  addClap(event) {
    event.preventDefault()
    //console.log("hi")
    // this.clapCountTarget.innerHTML = 'David'
    let slug = event.currentTarget.dataset.slug
    let target = this.clapCountTarget
    axios.post(`/stories/${slug}/clap`)
      .then(function (response) {
        let status = response.data.status
        switch(status){
          case 'sign_in_first':
            alert('你必須先登入')
            break
          default:
            target.innerHTML = status
        }
      })
        .catch(function (error) {
            console.log(error)
      })
  }
}
