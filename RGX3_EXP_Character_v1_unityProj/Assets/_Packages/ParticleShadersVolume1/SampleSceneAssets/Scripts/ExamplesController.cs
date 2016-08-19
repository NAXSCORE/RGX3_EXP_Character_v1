using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class ExamplesController : MonoBehaviour {
	public GameObject canvas = null;
	public Text text = null;

	public string[] examplesDesc = null;
	public GameObject[] examples = null;

	void Start()
	{
		canvas.SetActive (true);
		//Example1();
		activateExample (1);
	}

	public void activateExample(int index)
	{
		index --;
		foreach (GameObject example in examples)
		{
			if (example == examples[index])
				example.SetActive(true);
			else
				example.SetActive(false);
		}

		text.text = examplesDesc [index];
	}

}
