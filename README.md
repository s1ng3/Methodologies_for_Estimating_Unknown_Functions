# ***Study on Methodologies for Estimating Unknown Functions*** 📚

**Author:** Tudor-Cristian Sîngerean 🧑‍💼

## Project Description

The objective of this project is to perform polynomial regression on a two-variable dataset, aiming to model the relationship between the input variables and the output variable.

The code utilizes MATLAB to implement polynomial regression, exploring different polynomial degrees and evaluate the model's performance on identification and validation datasets.

Imagine we have a dataset containing information about the **temperature (X1)** and **humidity (X2)** in a particular region and their corresponding effect on **crop yield (Y)**. The goal of this project could be to develop a predictive model using polynomial regression to understand the non-linear relationship between temperature, humidity, and crop yield.


## Implementation

For developing a model for a specific function, using a polynomial approximator is the optimal approach. The model is based on a specific function called ‘**g\_line**’ which will be used in order to create **ĝ**.

The computation of the model's coefficients (**θ**) relies on an essential vector, which is obtained by dividing the **ϕ** and **Y** matrices θ = ϕ /Y

By increasing or decreasing the degree *,* the dimensions of the matrix **ϕ** changes.

Upon  achieving  the  coefficients **θ** , the generation of the predictive model for both the identification and validation datasets results through the matrix multiplication of **ϕ** and **θ**.

![Identification vs Validation Error](https://github.com/s1ng3/Shoe_Shop/assets/89934251/e782270f-f5f6-4bf7-82b9-0d9204ee1e27)

## Tuning Parameters

The value of **varies** and one can observe that by taking certain values of **<var>**, the validation data differs significantly.

By increasing the **<var>**, the model will be more fitted to the identification data and will cause the ‘overfitting’ phenomenon.

By decreasing the **<var>**, the model will be less fitted to the identification data and will cause the ‘underfitting’ phenomenon.

It can be observed that, by increasing drastically, not only that the model will be extremely overfitted but the performance diminishes also.

## Plots

To provide the precision of the model on the validation data, we calculate the **Mean Squared Error (MSE)** for each value of **<var>**. This way we can measure how close the model's predictions are to the actual values from the validation set.

By calculating the MSE for different values of **<var>** with the below formula, the understanding of how well the model is doing under certain conditions is easier.

The most straightforward way to visualize the accuracy of the model concerning the value is by creating a plot using **Matlab**.

It can be observed that the identification error slightly differs from the validation error.

In the provided dataset, the optimal model for the validation data corresponds to **<var> = 5**. Additionally, it's noticeable that as increases, the Mean Squared Error (MSE) for the training data decreases, indicating a better fit. However, for the validation data, the MSE tends to increase for larger values, suggesting the occurrence of overfitting.

![Data Variation](https://github.com/s1ng3/Shoe_Shop/assets/89934251/a58d61ae-aa15-498f-ad49-af4e9e9bef13)

## Conclusions

- Depending on the given **<var>**, the predicted model can suffer several changes due to its malleable nature. Both overfitted and underfitted cases are based on the **<var>**.

- the **ĝ** matrix is computed by two input datasets that are approximated by a polynomial function in order to result a predictive model on a given situation.

- Real life problems such as predicting the spread of a virus or other infectious diseases, evaluating trends and forecasts. 📊
